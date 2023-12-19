import lldb

# https://lldb.llvm.org/use/python-reference.html#running-a-python-script-when-a-breakpoint-gets-hit
# https://lldb.llvm.org/python_reference/lldb.SBFrame-class.html#EvaluateExpression

def makeWebviewInspectableCallback(frame, bp_loc, extra_args, internal_dict):
    target = lldb.debugger.GetSelectedTarget()
    process = target.GetProcess()
    thread = process.GetSelectedThread()

    print("webview inspectable set to true")
    frame.EvaluateExpression("[(WKWebView *)self.webView setInspectable:YES]")
    process.Continue()

def makeWebviewInspectable(debugger, command, result, internal_dict):
    """
    This can inspect wkwebview with Safari Web Inspector.
    """
    target = debugger.GetSelectedTarget()
    bp = target.BreakpointCreateByName("-[XMHWebView layoutSubviews]")

    bp.SetScriptCallbackFunction("testMethod.makeWebviewInspectableCallback")
    #bp.SetScriptCallbackBody("print('wkwebview init be called')")

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f testMethod.makeWebviewInspectable makeWebviewInspectable')
    print("init makeWebviewInspectable command")
    debugger.HandleCommand("makeWebviewInspectable")
