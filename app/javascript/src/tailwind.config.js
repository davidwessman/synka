module.exports = {
  prefix: "",
  important: false,
  separator: ":",
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "Inter",
          "system-ui",
          "-apple-system",
          "BlinkMacSystemFont",
          "Segoe UI",
          "Roboto",
          "Helvetica Neue",
          "Arial",
          "Noto Sans",
          "sans-serif",
          "Apple Color Emoji",
          "Segoe UI Emoji",
          "Segoe UI Symbol",
          "Noto Color Emoji",
        ],
      },
      maxWidth: {
        "hd": "110rem",
      },
      screens: {
        "xxl": "1800px",
      },
    },
  },
  variants: {},
  corePlugins: {},
  plugins: [require("@tailwindcss/ui")],
};
