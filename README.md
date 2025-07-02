# get_it_scope_study

# 연구가 필요한 문제 상황
Home에서 user데이터를 fetching해서 viewModel ValueNotifier에 값을 할당해준뒤,<br>
서브라우트인 Detail 화면으로 push로 이동하고 다시 Pop했을때 user데이터가 loading으로 초기화되어있다.<br>
viewModel을 injectable(factory)로 만들어둔 상태이긴 하나, 서브라우트로 이동했을때, 기존 Route의 메모리가 유지되고 있을 것이라 예상했으나<br>
그렇지 않고 메모리에서 제거되고, 초기화돼서 발생하는 이슈!<br>


<image src="https://github.com/user-attachments/assets/70f4b94b-7e0e-4b7b-92c1-8fc55c2dddd7" alt="Issue" width="330">
<br>


<br>
### HomeViewModel 코드

``` dart
@injectable
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._userRepository);

  final UserRepository _userRepository;

  /// 사용자 정보 상태
  final ValueNotifier<AsyncValue<UserModel>> userState = ValueNotifier(
    const AsyncLoading(),
  );

  /// 사용자 정보 Fetching
  Future<void> fetchUser() async {
    final Result<UserModel> result = await _userRepository.getUser();

    result.when(
      ok: (user) {
        userState.value = AsyncData(user);
      },
      error: (error) {
        userState.value = AsyncError(error, StackTrace.current);
      },
    );
  }
}

```
<br>

### HomeScreen 코드
``` dart

class HomeScreen extends BaseScreen {
const HomeScreen({super.key, required this.viewModel});

final HomeViewModel viewModel;

@override
Widget buildScreen(BuildContext context) {
  /// 사용자 정보 상태 Listener
  useListenable(viewModel.userState);

  /// 사용자 정보 Fetching
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.fetchUser();
    });

    return null;
  }, []);
...
```
