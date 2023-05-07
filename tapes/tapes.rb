# frozen_string_literal: true

commands = [
  # JSON
  "jt", "jx", "jy",
  # TOML
  "tj", "tx", "ty",
  # XML
  "xj", "xt", "xy",
  # YAML
  "yj", "yt", "yx"
]

commands.each do |command|
  foo_filename =
    case command[0]
    when "j" then "foo.json"
    when "t" then "foo.toml"
    when "y" then "foo.yaml"
    when "x" then "foo.xml"
    end

  tape = <<~TAPE
    Output assets/#{command}.gif

    Require xvert

    Set Shell "bash"
    Set FontSize 32
    Set Width 1200
    Set Height 600

    Hide
    Type "cd ./tapes" Enter
    Ctrl+l
    Show

    Type "cat #{foo_filename}" Sleep 500ms Enter Sleep 500ms
    Sleep 1s
    Type "clear" Sleep 500ms Enter Sleep 500ms

    Type "xvert #{command} < #{foo_filename}" Sleep 500ms  Enter

    Sleep 5s
  TAPE
  tape_filename = "tapes/#{command}.tape"

  File.write(tape_filename, tape)
  `vhs < #{tape_filename}`
end
