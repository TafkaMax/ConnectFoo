import { PlayerType } from "../context/AppContext";


//after hours of rigorous headache i turned to "The Stack" and found this
//https://stackoverflow.com/a/32771401 win condition check


//Don't call this method seperatetly, called within didWinMain
    
export const didWinSecondary = (boardState: PlayerType[][], currentPlayer: PlayerType, y: number, x: number, yDelta: number, xDelta: number) => {
    let match = false;
    let matches = 0;
    //if locations is [3][2] [[x,x,^,x,x,x,x],
//                            [x,x,|,x,x,x,x],
//                            [x,1,1,1,x,x,x],
//                            [<,-1,O,1,-,-,>],
//                            [x,-1,-1,-1,x,x,x],
//                            [x,x,V,x,x,x,x],
// Separate into 2 sides, i go this way and then + the other way to make length.
//get dimensions to move col = 2, row =3 while ()

     //must gives positive direction vector or something length 
     // must give us other direction vector or something length
    

    while(y < boardState.length && y >= 0 && x < boardState[y].length && x >= 0) {
        let locationToCheck = boardState[y][x];
        if(locationToCheck !== currentPlayer) {
            break;
        } else if (locationToCheck === currentPlayer && !match) {
            match = true;
        } else if (locationToCheck === currentPlayer && match) {
            matches++;
        }
        y += yDelta;
        x += xDelta   
    }
    return matches;
}

export const didWinMain = (boardState: PlayerType[][], currentPlayer: PlayerType, y: number, x:number ) => {
    let rowNumber = findInsertedMoveRow(boardState, currentPlayer, y, x);

    if(rowNumber < boardState.length && rowNumber >= 0 && x < boardState[rowNumber].length && x >= 0) {
        let locationToCheck = boardState[rowNumber][x];
        if(locationToCheck !== currentPlayer) {
            return false;
        } else if (locationToCheck === currentPlayer) {
            return (didWinSecondary(boardState, currentPlayer, rowNumber, x, 1, 0) + 
                didWinSecondary(boardState, currentPlayer, rowNumber, x, -1, 0) + 1 >= 4) ||
                (didWinSecondary(boardState, currentPlayer, rowNumber, x, 0, 1) +
                didWinSecondary(boardState, currentPlayer, rowNumber, x, 0, -1) +1 >= 4) ||
                (didWinSecondary(boardState, currentPlayer, rowNumber, x, 1, 1) +
                didWinSecondary(boardState, currentPlayer, rowNumber, x, -1, -1) + 1 >= 4) ||
                (didWinSecondary(boardState, currentPlayer, rowNumber, x, -1, 1) +
                didWinSecondary(boardState, currentPlayer, rowNumber, x, 1, -1) + 1>= 4);
        }
    } 

    return false;
}

export const findInsertedMoveRow = (boardState : PlayerType[][], currentPlayer: PlayerType, y: number, x: number) => {
    for (let i = 0; i < boardState.length; i++) {
        if(boardState[i][x] === currentPlayer) {
            return i;
        }
    }
    return y;
}

export function checkForSpotInColumn(prevBoardState: PlayerType[][], currentPlayer: string, y: number, x: number) {
    for (let i = prevBoardState.length - 1; i >= 0; i--) {
        if(prevBoardState[i][x] == '') {
            return i
        }
    }
}

export function validMove(prevBoardState: PlayerType[][],currentPlayer: PlayerType, y: number, x: number) {
    for (let i = 0; i < prevBoardState.length; i++) {
        if(prevBoardState[i][x] == '') {
            return true;
        }
    }
}

export function checkDisabled(boardState: PlayerType[][], y: number, x: number) {
    return boardState[y][x] !== "";
}