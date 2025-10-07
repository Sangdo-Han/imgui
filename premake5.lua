project "ImGui"
    kind "StaticLib"
    language "C"
    cppdialect "C++17"
    staticruntime "on"

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
        "include",
        "backends"
    }

    filter "system:linux"
        pic "On"
        systemversion "latest"
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
