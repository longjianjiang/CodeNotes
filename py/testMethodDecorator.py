"""@login_required 装饰器的几种写法与对比。

运行: python3 testMethodDecorator.py
"""

from csv import Error
import functools


class Session:
    def __init__(self, user=None, role=None):
        self.user = user
        self.role = role

    @property
    def is_logged_in(self):
        return self.user is not None


session = Session()


class NotLoggedInError(Exception):
    pass


class PermissionDeniedError(Exception):
    pass


def login_required(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        if not session.is_logged_in:
            raise NotLoggedInError(f"请先登录再调用 {func.__name__}()")
        return func(*args, **kwargs)

    return wrapper


def require_role(func=None, *, role=None):
    def decorator(f):
        @functools.wraps(f)
        def wrapper(*args, **kwargs):
            if not session.is_logged_in:
                raise NotLoggedInError(f"请先登录再调用 {f.__name__}()")
            if role is not None and session.role != role:
                raise PermissionDeniedError(f"{f.__name__}() 需要 {role} 角色，当前是 {session.role}")
            return f(*args, **kwargs)

        return wrapper

    if func is not None:
        return decorator(func)
    return decorator


class LoginRequired:
    """类装饰器，用于需要保存状态的场景。"""

    def __init__(self, func):
        functools.update_wrapper(self, func)
        self.func = func
        self.calls = 0

    def __call__(self, *args, **kwargs):
        if not session.is_logged_in:
            raise NotLoggedInError(f"请先登录再调用 {self.func.__name__}()")
        self.calls += 1
        return self.func(*args, **kwargs)


@login_required
def view_profile():
    """查看个人主页"""
    return f"{session.user} 的个人主页"


@require_role
def post_comment(text):
    return f"{session.user} 评论: {text}"


@require_role(role="admin")
def delete_user(name):
    return f"{session.user} 删除了用户 {name}"


@LoginRequired
def upload_avatar(path):
    return f"{session.user} 上传了头像 {path}"


if __name__ == "__main__":
    try:
        view_profile()
    except Exception as e:
        print(f"call error : {e}")
    
    session.user, session.role = "李四", "user"
    print(view_profile())
    print(post_comment("你好"))
    print(upload_avatar("a.png"))

    try:
        delete_user("张三")
    except PermissionDeniedError as e:
        print(f"拦截: {e}")

    session.role = "admin"
    print(delete_user("张三"))
