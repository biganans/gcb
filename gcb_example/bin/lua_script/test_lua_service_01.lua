package.path = package.path ..';..\\src\\generate\\?.lua;..\\src\\?.lua';
--package.cpath �� dll�ļ���Ŀ¼


require "op_def"
local data_packet = require "data_packet"

function update(ms_delay)	
end


function notify_send_to_cpp()
	local lua_msg = data_packet.new(TEST_LUA_TO_CPP_PACKET)
	lua_msg.from_name = "lua_service"
	lua_msg.from_id = 10
	lua_msg.dogs = {{dog_name = "���",dog_age = 18}, {dog_name = "С��",dog_age = 9}}
	serialize_lua_op_obj__TEST_LUA_TO_CPP_PACKET(lua_msg, lua_msg)
	lua_send_to_cpp(lua_msg.data,g_service_this)
	lua_msg:free()

	local lua_msg01 = data_packet.new(TEST_LUA_TO_CPP_STREAM)
	lua_msg01:start_write()
	lua_msg01:put_bool(true)
	lua_msg01:put_bool(nil)
	lua_msg01:put_int32(1024)
	lua_msg01:put_string("�߻���ɵ��")
	lua_msg01:put_string("�ϰ�Ҳ��ɵ��")
	lua_msg01:end_write()
	lua_send_to_cpp(lua_msg01.data,g_service_this)
	lua_msg01:free()
end



