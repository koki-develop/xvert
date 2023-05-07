# frozen_string_literal: true

COMMANDS = [
  # JSON
  "jt", "jx", "jy",
  # TOML
  "tj", "tx", "ty",
  # XML
  "xj", "xt", "xy",
  # YAML
  "yj", "yt", "yx"
].sort

def update_tapes
  COMMANDS.each do |command|
    from_format, = extract_formats(command)
    foo_filename = "foo.#{from_format}}"

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
end

def print_usage
  puts <<~TEXT
    ## Usage

    ```console
    $ xvert help
    #{`xvert help`.strip}
    ```

    #{
      COMMANDS.map do |command|
        from, to = extract_formats(command)
        "- [#{from.upcase} to #{to.upcase}](##{from}-to-#{to})"
      end.join("\n")
    }

    #{
      COMMANDS.map do |command|
        from, to = extract_formats(command)

        <<~TEXT
          ### #{from.upcase} to #{to.upcase}

          ```console
          $ xvert #{command} < foo.#{from}
          ```

          ![](./assets/#{command}.gif)
        TEXT
      end.join("\n")
    }
  TEXT
end

def extract_formats(command)
  [extract_format(command[0]), extract_format(command[1])]
end

def extract_format(char)
  {
    "j" => "json",
    "t" => "toml",
    "y" => "yaml",
    "x" => "xml"
  }[char]
end

case ARGV[0]
when "tapes" then update_tapes
when "usage" then print_usage
end
