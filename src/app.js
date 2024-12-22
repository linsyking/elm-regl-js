// import * as regl from "regl";
const regl = require('regl')()

import { drawRect} from "./rect/rect";
import { drawTriangle } from "./triangle/triangle";

regl.frame(({ time }) => {
    regl.clear({
        color: [0, 0, 0, 0],
        depth: 1
    })
    
    console.log(time)

    let num = 40;
    for (let i = 0; i < num*2; i++) {
        for (let j = 0; j < num*2; j++) {
            // drawTriangle(-1+i/num+0.02, 1 - j/num-0.03)({
            //     color: [
            //         Math.cos(time * 0.001),
            //         Math.sin(time * 0.0008),
            //         Math.cos(time * 0.003),
            //         1
            //     ],
            //     offset : [0,0]
            // })
            let modd = (time % 10)/20;
            let xof = -1+i/num + modd;
            let yof = 1 - j/num;
            drawTriangle({
                x : [xof, yof],
                y : [0.02+xof, yof],
                z : [0.01 + xof, 0.02+yof],
                uTime : time + j/num
            })
            // drawRect({
            //     off : [xof,yof],
            //     scale : [0.01, 0.01]
            // })
        }
    }

})
