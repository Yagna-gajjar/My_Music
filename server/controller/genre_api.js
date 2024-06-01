import songs from "../model/songs.js";
import mongoose from "mongoose";

export const Genre = async (req, res) => {
    try {
        const pipeline = [
            {
                $group: {
                    _id: '$genre',
                    songs: {
                        $push: {
                            title: '$title',
                            artist: '$artist',
                            duration: '$duration',
                        },
                    },
                },
            },
            { $project: { _id: 0, genre: '$_id', image: { $concat: [{ $replaceAll: { input: '$_id', find: ' ', replacement: '_' } }, '.png'] } } },
        ];
        const genre_data = await songs.aggregate(pipeline);

        if (!genre_data) {
            return res.status(404).json({ msg: "genre not found" });
        }
        res.status(200).json(genre_data);
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
}