import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three';
import { CSS2DObject } from 'three-css2drender'

export default class extends Controller {

    static targets = [ "replace", "wrapper", "songdata" ]

    connect() {
        const renderer = new THREE.WebGLRenderer();
        renderer.setSize(this.wrapperTarget.dataset.canvaswidth, this.wrapperTarget.dataset.canvasheight);
        this.replaceTarget.appendChild( renderer.domElement);
        const camera = new THREE.PerspectiveCamera(45, this.wrapperTarget.dataset.canvaswidth/this.wrapperTarget.dataset.canvasheight, 1, 500);
        camera.position.set(0, 0, 100);
        camera.lookAt(0,0, 0);
        const constellationScene = new THREE.Scene();
        const material = new THREE.LineBasicMaterial({color: '#'+this.wrapperTarget.dataset.linecolor});
        const points = this.points()
        const geometry = new THREE.BufferGeometry().setFromPoints(points)
        const line =  new THREE.LineLoop(geometry, material)
        constellationScene.add(line)
        renderer.render(constellationScene, camera)
    }

    points(){
        const points = []
        const chain = [0]
        const songData = JSON.parse(this.songdataTarget.dataset.songs)
        for(let i=0; i<songData.length; i++){
            let coinFlip = Math.floor(Math.random()+1);
            let nextCoord = Math.floor(Math.random() * 51)+10;
            if(coinFlip>0){
                nextCoord = chain[i]+nextCoord
            }else{
                nextCoord = chain[i]-nextCoord
            }
            points.push( new THREE.Vector3(nextCoord, chain[i], 0))
            chain.push(nextCoord)
        }
        return points
    }
}