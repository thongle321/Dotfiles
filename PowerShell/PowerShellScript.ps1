# Shortcut for program
Function osu { Start-Process "D:\Game\osu!\osu!.exe"}
Function floorp { Start-Process "C:\Program Files\Floorp Lightning\floorp.exe"}
Function Emacs { Start-Process "C:\Users\Moderator\scoop\apps\emacs\29.1\bin\emacs.exe"}
# Useful shortcuts for traversing directories
Function cd.. { Set-Location ..\.. }
Function cd.... { Set-Location ..\..\.. }

#Get path
Function ll { Get-ChildItem -Path $pwd -File }

Function reload-profile {
    & $profile
}
# ... (other parts of the script)

# clangd-project.ps1

function Create-CMakeLists {
    $content = @"
cmake_minimum_required(VERSION 3.19)
project(my_project)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Change path from /src if needed, or add more directories
file(GLOB_RECURSE sources
        "`${CMAKE_SOURCE_DIR}/src/*.c"
        "`${CMAKE_SOURCE_DIR}/src/*.cpp"
        )
# Add precompiler definitions like that:
add_definitions(-DSOME_DEFINITION)

add_executable(my_app `${sources})

# Add more include directories if needed
target_include_directories(my_app PUBLIC "${CMAKE_SOURCE_DIR}/include")
"@
    $content | Out-File "CMakeLists.txt"
    Write-Host "CMakeLists.txt file created successfully."
}

# Execute the function when the script is invoked with "clangd-project" command
if ($MyInvocation.InvocationName -eq 'clangd-project') {
    Create-CMakeLists
}

#Init StarShip
Invoke-Expression (&starship init powershell)
