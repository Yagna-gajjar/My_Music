import express from "express";
import { Songs } from "../controller/songs_api.js";

const route = express.Router();

route.get("/AllSongs", Songs);

export default route;