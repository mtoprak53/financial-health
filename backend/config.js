"use strict"

/** Shared config for application; can be required many places. */

require("dotenv").config();
require("colors");

const SECRET_KEY = process.env.SECRET_KEY || "secret-dev";

const PORT = +process.env.PORT || 3001;

// Use dev database, testing database, or via env var, production database
function getDatabaseUri() {
  return (process.env.NODE_ENV === "test")
        ? "finhealth_test"
        : process.env.DATABASE_URL || "finhealth";
}

// Speed up bcrypt during test, since the algorithm safety isn't being tested
// Evaluate later if this should be increased for non-test use
const BCRYPT_WORK_FACTOR = process.env.NODE_ENV === "test" ? 1 : 12;

if (process.env.NODE_ENV !== "test" && 
    process.env.NODE_ENV !== "other") {
  console.log(getDatabaseUri());
  console.log(process.env.NODE_ENV);
  console.log("\n**********".blue);
  console.log("Footy Config".red);
  console.log("----------".blue);
  console.log("SECRET KEY:".yellow, SECRET_KEY);
  console.log("PORT:".yellow, PORT.toString());
  console.log("BCRYPT_WORK_FACTOR:".yellow, BCRYPT_WORK_FACTOR.toString());
  console.log("Database:".yellow, getDatabaseUri());
  console.log("**********\n".blue);
}

module.exports = {
  SECRET_KEY, 
  PORT, 
  BCRYPT_WORK_FACTOR, 
  getDatabaseUri, 
}