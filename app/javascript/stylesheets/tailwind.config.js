module.exports = {
  purge: {
    enabled: ["production", "staging"].includes(process.env.NODE_ENV),
    content: [
      "./**/*.html.erb",
      "./**/**/*.html.erb",
      "./**/*.html+phone.erb",
      "./app/helpers/**/*.rb",
      "./app/javascript/**/*.js",
    ],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'primary': {
          100: '#FEA285',
          200: '#FE7D54',
          300: '#FE5520',
        },
        'secondary': {
          100: '#9E71EA',
          200: '#7F44E3',
          300: '#6320D5',
        },
        'tertiary': {
          100: '#FED65D',
          200: '#FEC928',
          300: '#F4B801',
        },
        'sandy': {
          50: '#FEF8F8',
        },
        "code-400": "#fefcf9",
        "code-600": "#3c455b",
      },
      fontFamily: {
        'default': "Poppins",
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
