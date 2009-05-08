-- Path to FreeArc
freearc = "\"C:\\Program Files (x86)\\FreeArc\\bin\\FreeArc.exe\" "

-- FreeArc archive extensions
arcext = "arc"

-- 1 for cascaded menus, nil for flat
cascaded = nil


-- user-defined function that returns Right-Click Menu items for given filename(s)
register_menu_handler (function (filenames)
  --if filenames.getn
  filename = "\""..filenames[1].."\""
  menu = {
    {text = "Open with &FreeArc",     command = freearc..filename,                                  help = "Open the selected archive(s) with FreeArc"},
    {text = "Extract to new folder",  command = freearc.."x -ad --noarcext -- "..filename,          help = "Extract the selected archive(s) to new folder"},
    {text = "Extract here",           command = freearc.."x --noarcext -- "..filename,              help = "Extract the selected archive(s) to the same folder"},
    {text = "Test",                   command = freearc.."t --noarcext -- "..filename,              help = "Test the selected archive(s)"},
    {text = "Compress with FreeArc",  command = freearc.."a --noarcext -- default.arc "..filename,  help = "Compress the selected files using FreeArc"}
  }

  if cascaded then
    menu = { {text = "FreeArc", submenu = menu, help = "FreeArc commands"} }
  end

  return menu
end)

--os.execute ("start "..arg)