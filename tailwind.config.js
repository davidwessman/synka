module.exports = {
  content: [
    "./app/javascript/**/*.js",
    "./app/views/**/*.html.erb",
    "./app/views/**/*.js",
    "./app/helpers/**/*.rb",
  ],
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
  ],
};
