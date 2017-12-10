#
# ──────────────────────────────────────────────────────────────────── III ─────
#   :::::: F O C U S E D   W I N D O W : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    kwm:     "/usr/local/bin/kwmc query space active tag"
    chunkwm: "echo $(/usr/local/bin/chunkc tiling::query --window owner) - " +
             "$(/usr/local/bin/chunkc tiling::query --window name):::" +
             "$(/usr/local/bin/chunkc tiling::query --desktop mode)"
    # focusedWindow: """
    #   osascript -e 'global frontApp, frontAppName, windowTitle
    #   set windowTitle to ""
    #   tell application "System Events"
    #       set frontApp to first application process whose frontmost is true
    #       set frontAppName to name of frontApp
    #       tell process frontAppName
    #           tell (1st window whose value of attribute "AXMain" is true)
    #               set windowTitle to value of attribute "AXTitle"
    #           end tell
    #       end tell
    #   end tell
    #   return frontAppName & " — " & windowTitle'
    # """

  #
  # ─── COLORS ─────────────────────────────────────────────────────────────────
  #

  colors =
    black:   "#3B4252"
    red:     "#BF616A"
    green:   "#A3BE8C"
    yellow:  "#EBCB8B"
    blue:    "#81A1C1"
    magenta: "#B48EAD"
    cyan:    "#88C0D0"
    white:   "#D8DEE9"

  #
  # ─── COMMAND ────────────────────────────────────────────────────────────────
  #

  command: "echo " +
           "$(cat ~/.cache/wal/colors.json):::" +
           "$(#{ commands.chunkwm })"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 1000

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    """
    <link rel="stylesheet" href="./font-awesome/font-awesome.min.css" />

    <div class="window">
      <i class="fa fa-television"></i>
      <span class="mode"></span>
      <span class="window-output">
        <i class="fa fa-window-maximize"></i>
        <span class="window-output-text"></span>
      </span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  update: ( output ) ->
    output = output.split(':::')
    wal = JSON.parse output[0]
    window = output[1]
    mode = output[2].trim()

    $( ".window" ).css({ color: wal.colors.color5 })
    $( ".window-output" ).css({ color: wal.special.foreground })
    $( ".window-output-text" ).text( "#{ window }" )
    $( ".mode" ).text( "[#{ mode }]")

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .window
      color: #{ colors.white }
      display: flex
      align-items: center
      justify-items: center

    .window-output
      padding-left: 0px
      max-width: calc(55% - 165px)
      margin: auto
      text-overflow: ellipsis
      overflow: hidden
      white-space: nowrap

    .mode
      padding: 0 5px 1px


    width: 100%
    text-overflow: ellipsis
    overflow: hidden
    white-space: nowrap
    bottom: 2px
    left: 15px
    font-family: 'SF Compact Text'
    font-size: 13px
    font-smoothing: antialiasing
    z-index: 0
    opacity: 1
  """

# ──────────────────────────────────────────────────────────────────────────────
