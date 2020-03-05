require("win32exts")
win32exts.set_acp(0)

--
-- ����ģ�������Ϣ
--
print("----------")
iii = win32exts.load_sym("*", "*")
iii = win32exts.load_sym("user32", "*")

--
-- �����ڴ�
--
g_buf = win32exts.malloc(2*260)

--
-- ��ȡ��ǰ����·��
--
g_exe_handle = win32exts.GetModuleHandleW(nil)
win32exts.GetModuleFileNameW(g_exe_handle, g_buf, 260)
g_exe = win32exts.read_wstring(g_buf, 0, -1)

------------------------------------------------------------------

--
-- ����һ��COM������������Լ����Լ�Ϊ����
--
win32exts.CoInitialize();
win32atls = win32exts.create_object("win32exts.win32atls")
print(win32atls)
assert(win32atls)

-- ��ѯ�ӿ�
win32atls_sub = win32atls.query_interface("IRunningObjectTable")
assert(not win32atls_sub)
win32atls_sub = win32atls.query_interface("IDispatch")
assert(win32atls_sub)

-- ִ��COM������list_sym()
local var = win32atls.invoke("list_sym")

-- ִ��COM������load_sym("ole32.dll", "*")
local var = win32atls.invoke("load_sym", "ole32.dll", "*")

-- �ٴ�ִ��COM������list_sym()
local var = win32atls.invoke("list_sym")
win32atls.release()
if win32atls_sub then
	win32atls_sub.release()
end
print("win32exts.win32atls.list_sym = " .. var .. "\n")

------------------------------------------------------------------

--
-- ������Ϣ��
--
win32exts.MessageBoxA(nil, "start���A", nil, nil)

-- ���ֽ�API������ {} ������
win32exts.MessageBoxW(nil, {"start���W"}, nil, nil)
print("start���")

------------------------------------------------------------------

--
-- �˳�����
--
win32exts.ExitProcess(-123)
return
