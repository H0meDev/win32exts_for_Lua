--
-- ���� COM ���, �򿪼�����
--

require "win32exts"
--��ʼ������ҳ
win32exts.set_acp(0)
--��ʼ�������
win32exts.co_init(true)

wsh = win32exts.create_object("Wscript.Shell")

--wsh.Run("calc")
wsh.invoke("Run", "calc")

wsh.release()
