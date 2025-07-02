# get_it_scope_study

# 연구가 필요한 문제 상황
Home에서 user데이터를 fetching해서 viewModel ValueNotifier에 값을 할당해준뒤,<br>
서브라우트인 Detail 화면으로 push로 이동하고 다시 Pop했을때 user데이터가 loading으로 초기화되어있다.<br>
viewModel을 injectable(factory)로 만들어둔 상태이긴 하나, 서브라우트로 이동했을때, 기존 Route의 메모리가 유지되고 있을 것이라 예상했으나<br>
그렇지 않고 메모리에서 제거되고, 초기화돼서 발생하는 이슈!<br>
그리고, context가 메모리에서 사라진건 아니었던터라 home으로 돌아왔을때 useEffect 로직도 작동하지 않는다.<br>

<img width="330" alt="issue" src="https://github.com/user-attachments/assets/0277c70c-7f94-463a-aeea-46b713dfaa4e" />

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

# 고민한 방법 1 : ViewModel이 초기화되는걸 냅두고, ViewModel 객체가 생길때마다 로직 수행
``` dart
@injectable
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._userRepository) {
    logger.d('HomeViewModel initialized');
    fetchUser();
  }
...
```
<br>
이렇게하면 pop이 됐을때, HomeViewModel이 다시 생성되면서, fetchUser도 수행되어, 약간의 로딩이 있긴하지만
리빌드가 잘 된다.
<br>
하지만, 유지되어도 되는 State를 다시 fetching해야 되는 문제는 여전히 존재한다.<br>
State를 ViewModel에서 관리하지 않고, Screen에서 useState로 관리하면 해결될것 같지만,<br>
특정 데이터는 ViewModel에서 중앙관리를 하고 싶을수도있을 것 같아서 고민...
