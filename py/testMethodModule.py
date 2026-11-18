import testMethodDecorator as m

print("本模块 __name__          =", __name__)
print("被导入模块 __name__      =", m.__name__)

print("\n=== 函数元信息 ===")
print("  __module__   =", m.view_profile.__module__)
print("  __name__     =", m.view_profile.__name__)
print("  __qualname__ =", m.view_profile.__qualname__)
print("  __doc__      =", m.view_profile.__doc__)

