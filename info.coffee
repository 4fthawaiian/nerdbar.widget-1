#
# ──────────────────────────────────────────────── II ──────
#   :::::: I N F O : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    battery: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
             "| cut -f1 -d';'"
    time   : "date +\"%H:%M\""
    wifi   : "/System/Library/PrivateFrameworks/Apple80211.framework/" +
             "Versions/Current/Resources/airport -I | " +
             "sed -e \"s/^ *SSID: //p\" -e d"
    volume : "osascript -e 'output volume of (get volume settings)'"

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
           "$(#{ commands.battery }):::" +
           "$(#{ commands.time }):::" +
           "$(#{ commands.wifi }):::" +
           "$(#{ commands.volume }):::"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 2000

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    """
    <link rel="stylesheet" href="nerdbar.widget/font-awesome/font-awesome.min.css" />

    <div class="wifi">
      <i class="fa fa-wifi"></i>
      <span class="wifi-output"></span>
    </div>
    <div class="volume">
      <span class="volume-icon"></span>
      <span class="volume-output"></span>
    </div>
    <div class="battery">
      <span class="battery-icon"></span>
      <span class="battery-output"></span>
    </div>
    <div class="time">
      <i class="fa fa-clock-o"></i>
      <span class="time-output"></span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  update: ( output ) ->
    output = output.split( /:::/g )

    wal  = JSON.parse output[ 0 ]
    battery = output[ 1 ]
    time    = output[ 2 ]
    wifi    = output[ 3 ]
    volume  = output[ 4 ]

    $( ".battery-output" ) .text( "#{ battery }" )
    $( ".battery" ).css({ color: wal.colors.color5 })
    $( ".time-output" )    .text( "#{ time }" )
    $( ".time" ).css({ color: wal.colors.color15 })
    $( ".wifi-output" )    .text( "#{ wifi }" )
    $( ".wifi" ).css({ color: wal.colors.color3 })
    $( ".volume-output" )  .text( "#{ volume }%" )
    $( ".volume" ).css({ color: wal.colors.color15 })

    @handleBattery( Number( battery.replace( /%/g, "" ) ) )
    @handleVolume( Number( volume ) )

  #
  # ─── HANDLE BATTERY ─────────────────────────────────────────────────────────
  #

  handleBattery: ( percentage ) ->
    batteryIcon = switch
      when percentage <=  12 then "fa-battery-0"
      when percentage <=  25 then "fa-battery-1"
      when percentage <=  50 then "fa-battery-2"
      when percentage <=  75 then "fa-battery-3"
      when percentage <= 100 then "fa-battery-4"
    $( ".battery-icon" ).html( "<i class=\"fa #{ batteryIcon }\"></i>" )

  #
  # ─── HANDLE VOLUME ──────────────────────────────────────────────────────────
  #

  handleVolume: ( volume ) ->
    volumeIcon = switch
      when volume ==   0 then "fa-volume-off"
      when volume <=  50 then "fa-volume-down"
      when volume <= 100 then "fa-volume-up"
    $( ".volume-icon" ).html( "<i class=\"fa #{ volumeIcon }\"></i>" )

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .battery
      color: #{ colors.green }
    .time
      color: #{ colors.magenta }
    .wifi
      color: #{ colors.white }
    .volume
      color: #{ colors.cyan }

    display: flex
    div
      margin-right: 15px

    bottom: 2px
    right: 0px
    font-family: 'SF Compact Text'
    font-size: 13px
    font-smoothing: antialiasing
    z-index: 0
    opacity: 1
  """

# ──────────────────────────────────────────────────────────────────────────────
