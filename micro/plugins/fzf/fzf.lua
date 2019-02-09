VERSION = "1.0.5"

MakeCommand("fzf", "fzf.fzf", 0)

function removeNewlines(string_value)
	if string.find(string_value, "\n") then
		return string.gsub(string_value, "\n", "")
	else
		return string_value
	end
end

function reportedExitCode(string_value)
	local exit_code_string = "exit status "
	return string.sub(string_value, 1, string.len(exit_code_string)) == exit_code_string
end

function fzf()
	if CurView():CanClose() then
		local fzf_output = RunInteractiveShell("fzf", false, true)
		if not reportedExitCode(fzf_output) then
			local desired_path = removeNewlines(fzf_output)
			CurView():Open(desired_path)
			messenger:Message("Opened "..desired_path)
		end
	end
end

AddRuntimeFile("fzf", "help", "help/fzf.md")
