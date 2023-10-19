
URLS = {
  "https://raw.githubusercontent.com/jgunzelman88/cc-turtle/main/farming.lua",
  "https://raw.githubusercontent.com/jgunzelman88/cc-turtle/main/common",
  "https://raw.githubusercontent.com/jgunzelman88/cc-turtle/main/tree-felling.lua"
}

function downloadAndSave(url) 
  local parts = common.splitStr(url, "/")
  local filename = parts[#parts]
  shell.run("rm", filename)
  shell.run("wget", url)
end

for i = 1,#urls,1 do
  local url = URLS[i]
  downloadAndSave(url)
end