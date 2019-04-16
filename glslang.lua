-- scaffold geniefile for glslang

glslang_script = path.getabsolute(path.getdirectory(_SCRIPT))
glslang_root = path.join(glslang_script, "glslang")

glslang_includedirs = {
	path.join(glslang_script, "config"),
	glslang_root,
}

glslang_libdirs = {}
glslang_links = {}
glslang_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glslang_includedirs }
	end,

	_add_defines = function()
		defines { glslang_defines }
	end,

	_add_libdirs = function()
		libdirs { glslang_libdirs }
	end,

	_add_external_links = function()
		links { glslang_links }
	end,

	_add_self_links = function()
		links { "glslang" }
	end,

	_create_projects = function()

project "glslang"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glslang_includedirs,
	}

	defines {}

	files {
		path.join(glslang_script, "config", "**.h"),
		path.join(glslang_root, "**.h"),
		path.join(glslang_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
