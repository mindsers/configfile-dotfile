module.exports = {
  config: {
    fontSize: 12,
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    cursorShape: 'BLOCK',

    cursorColor: '#4D4D4D',
    foregroundColor: '#5C6370',
    backgroundColor: '#1E2127',
    borderColor: '#1E2127',

    padding: '12px 14px',

    colors: {
      black: '#000000',
      red: '#E06C75',
      green: '#98C379',
      yellow: '#D19A66',
      blue: '#61AFEF',
      magenta: '#C678DD',
      cyan: '#56B6C2',
      white: '#ABB2BF',
      lightBlack: '#5C6370',
      lightRed: '#E06C75',
      lightGreen: '#98C379',
      lightYellow: '#D19A66',
      lightBlue: '#61AFEF',
      lightMagenta: '#C678DD',
      lightCyan: '#56B6C2',
      lightWhite: '#FFFFFF'
    },

    shell: '/usr/local/bin/zsh',
    shellArgs: [],
    env: {},
    bell: 'SOUND',

    copyOnSelect: false
  },

  plugins: [
    'hyperterm-atom-dark'
  ],

  localPlugins: []
};
