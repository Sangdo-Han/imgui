project "ImGui"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- These are the common files required by ALL platforms.
    -- This now includes the complete "null" backend and common context APIs.
    files
    {
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
        "imgui_draw.cpp",
        "imgui_demo.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_tables.cpp"
    }

    includedirs
    {
        "include"
    }

    filter "system:linux"
        pic "On"
        systemversion "latest"
        staticruntime "On"
    
    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter {"system:windows", "configurations:Release"}
        buildoptions "/MT"