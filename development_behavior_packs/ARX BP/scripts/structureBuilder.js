import { world } from "@minecraft/server"
import { checkForItem } from "./checkForItem"
import { gDP, ssDP } from "./DPOperations"
import { ActionFormData } from "@minecraft/server-ui"

// StructureBuilder namespace - sb

// Catch player's intercations with blocks
world.afterEvents.playerSwingStart.subscribe((event) => {
    const p = event.player
    const b = p.getBlockFromViewDirection()?.block

    if (b && checkForItem(p, "mainhand", 'arx:structurebuilder_hammer')) {
        try {
            const sneaking = p.inputInfo.getButtonState("Sneak") === 'Pressed'
            const pointToSet = sneaking ? 2 : 1
            const responceColor = sneaking ? '§c' : '§a'

            ssDP(p, 'sb:lastPointSet', pointToSet)
            ssDP(p, `sb:point${pointToSet}`, b.location)
            p.sendMessage(`Saved ${responceColor}Point ${pointToSet}`)
        }
        catch { } // Block is too far away
    }
})

const defaultCoords = { x: 0, y: 0, z: 0 }
let megachunkId = 0

class BlocksMegaArray {
    constructor(dimension, pos1, pos2) {
        if (!dimension || typeof pos1 !== "object" || typeof pos2 !== "object") {
            console.warn('Trying to create BlocksMegaArray with irrelevant positions')
        }

        // Anchor is a Vector3 vertex of MegaArray with smallest values
        this.anchor = {
            x: Math.min(pos1.x, pos2.x),
            y: Math.min(pos1.y, pos2.y),
            z: Math.min(pos1.z, pos2.z)
        }
        // Size of all array
        this.size = {
            x: Math.abs(pos1.x - pos2.x) + 1,
            y: Math.abs(pos1.y - pos2.y) + 1,
            z: Math.abs(pos1.z - pos2.z) + 1
        }
    }

    registerMegachunks() {

    }

    // This is 2x2 default chunks. I mean, x = 32, y = default (can be decreased if needed), y = 32 blocks array
    static MegaChunk = class {
        constructor(pos1, pos2) {
            // Register ID
            this.uid = megachunkId
            megachunkId += 1
        }

        fillWithBlock(blockTypeId) {

        }
        createTickingArea() {
            world.dimension.runCommand('')
        }
        unloadTickingArea() {
            world.dimension.runCommand('')
        }
    }
}

// Use hammer (Right-click)
export function onUseSBHammer(p) {
    const point1 = gDP(p, 'sb:point1') ?? defaultCoords
    const point2 = gDP(p, 'sb:point2') ?? defaultCoords
    const hasAllPoints = point1 && point2
    const d = p.dimension

    // Form for player
    const form = new ActionFormData()

    form.title('StructureBuilder options')
    let body = '§aPoint 1§f: ' + getCoordinatesString(point1) + '\n' + '§cPoint 2§f: ' + getCoordinatesString(point2)

    const dx = Math.abs(point1.x - point2.x) + 1
    const dy = Math.abs(point1.y - point2.y) + 1
    const dz = Math.abs(point1.z - point2.z) + 1

    const minX = Math.min(point1.x, point2.x)
    const minY = Math.min(point1.y, point2.y)
    const minZ = Math.min(point1.z, point2.z)

    const volume = dx * dy * dz

    body += "\n§bVolume§f: " + volume + ' blocks'

    form.body(body)

    // Buttons
    if (hasAllPoints) {
        form.button('Delete blocks')
    }

    form.show(p).then(r => {
        switch (r.selection) {
            case 0:
                let errorsCounter = 0
                for (let x = 0; x < dx; x++) {
                    for (let y = 0; y < dy; y++) {
                        for (let z = 0; z < dz; z++) {
                            const b = d.getBlock({ x: minX + x, y: minY + y, z: minZ + z })
                            if (b) {
                                b.setType('minecraft:air')
                            } else {
                                errorsCounter++
                            }
                        }
                    }
                }
                if (errorsCounter === volume) p.sendMessage(`All blocks (${volume}) were too far to change them`)
                else if (errorsCounter) p.sendMessage(`Some blocks (${errorsCounter} of ${volume}) were too far to change them`)
                break

            case 1:

        }
    })
}

function getCoordinatesString(coords) {
    if (coords) {
        return Object.values(coords).join(', ')
    }
    else return 'Not set'
}