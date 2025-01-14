# 虚拟环境

```
error: externally-managed-environment
× This environment is externally managed
```

使用pip3 install openpyxl报如上错误。需要创建一个虚拟环境，为了不影响系统的py环境。

```
python3 -m venv myenv -- 创建

source myenv/bin/activate -- 激活

deactivate -- 退出
```
