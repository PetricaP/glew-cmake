project "GLEW"
    kind "StaticLib"
    language "C"
    
	targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GL/glew.h",
		"src/glew.c"
    }

	includedirs {
		"include",
	}

	defines {
		"GLEW_STATIC"
	}
    
	filter "system:windows"
        buildoptions { "-std=c11", "-lgdi32" }
        systemversion "10.0.17134.0"
        staticruntime "On"
        
        files {
			"include/wglew.h"
		}

		defines 
		{ 
            "_CRT_SECURE_NO_WARNINGS",
			"WIN32_MEAN_AND_LEAN",
			"VC_EXTRALEAN",
			"GLEW_BUILD"
		}

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"

	filter "system:linux"
        buildoptions { "-std=gnu17", "-lrt", "-lm", "-fPIC" }
        staticruntime "On"
        
        files
        {
			"include/glxew.h"
        }

		links
		{
			"X11",
			"Xext",
			"dl"
		}

		defines 
		{ 
			"GLEW_NO_GLU"
		}
