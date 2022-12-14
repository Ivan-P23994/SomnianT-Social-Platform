const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
        height: {
          "1vh": "1vh",
          "2vh": "2vh",
          "4vh": "4vh",
          "6vh": "6vh",
          "7vh": "7vh",
          "8vh": "8vh",
          "10vh": "10vh",
          "13vh": "13vh",
          "15vh": "15vh",
          "20vh": "20vh",
          "25vh": "25vh",
          "27vh": "27vh",
          "30vh": "30vh",
          "35vh": "35vh",
          "40vh": "40vh",
          "45vh": "45vh",
          "50vh": "50vh",
          "55vh": "55vh",
          "60vh": "60vh",
          "65vh": "65vh",
          "78vh": "78vh",
          "80vh": "80vh",
          "90vh": "90vh",
          "100vh": "100vh",
        },
        width: {
          "1vw": "1vw",
          "2vw": "2vw",
          "4vw": "4vw",
          "6vw": "6vw",
          "8vw": "8vw",
          "10vw": "10vw",
          "13vw": "13vw",
          "17vw": "17vw",
          "20vw": "20vw",
          "25vw": "25vw",
          "30vw": "30vw",
          "35vw": "35vw",
          "40vw": "40vw",
          "50vw": "50vw",
          "60vw": "60vw",
          "78vw": "78vw",
          "80vw": "80vw",
          "90vw": "90vw",
          "100vw": "100vw",
        },
        animation: {
          // Bounces 5 times 1s equals 5 seconds
          'bounce-short': 'bounce 1s ease-in-out 5'
        },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        '2xs': '.65rem'},
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
