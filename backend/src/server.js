const app = require("./app.js");

app.listen(app.get("port"), () => {
  console.log(`We are at the port ${app.get("port")}`);
});
