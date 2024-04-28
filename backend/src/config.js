require("dotenv").config();

module.exports = {
    app: {
        port: process.env.PORT || 3000,
    },
    mysql :  {
        host: process.env.mysqlHost || "localhost",
        user: process.env.mysqlUser || "root",
        password : process.env.mysqlPassword || "Edel_Son_1520_Arias",
        database: process.env.mysqlDb|| "NominaSystem",

    }
}