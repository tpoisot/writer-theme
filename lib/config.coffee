fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    ltheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 96%);
    @writer-fg: hsl(0, 0%, 36%);

    """

    dtheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(0, 0%, 8%);
    @writer-fg: hsl(0, 0%, 86%);

    """
    updateColor = () ->
      variant = atom.config.get "writer-syntax.themeVariant"
      path = "#{__dirname}/../styles/background.less"
      if variant is 'Dark'
        fs.writeFileSync path, dtheme
      else
        fs.writeFile path, ltheme

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.themeVariant', updateColor()