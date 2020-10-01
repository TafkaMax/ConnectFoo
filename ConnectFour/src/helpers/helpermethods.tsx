import { PlayerType } from "../context/AppContext";


//after hours of rigorous headache i turned to "The Stack" and found this
//https://stackoverflow.com/a/32771401 win condition check


//Don't call this method seperatetly, called within didWinMain
    
export const didWinSecondary = (boardState: PlayerType[][], currentPlayer: PlayerType, col: number, row: number, rowDelta: number, colDelta: number) => {
    let match = false;
    let matches = 0;
    while(row < boardState[0].length && row > 0 && col < boardState.length && col > 0) {
        let locationToCheck = boardState[col][row];
        if(locationToCheck !== currentPlayer && match) {
            break;
        } else if (locationToCheck === currentPlayer) {
            match = true;
            matches++;
        }
        row += rowDelta;
        col += colDelta
    }
    return matches === 4;
}

export const didWinMain = (boardState: PlayerType[][], currentPlayer: PlayerType, col:number, row: number) => {
    return didWinSecondary(boardState, currentPlayer, row, col, 1, 0) ||
                didWinSecondary(boardState, currentPlayer, row, col, -1, 0) ||
                didWinSecondary(boardState, currentPlayer, row, col, 0, 1) ||
                didWinSecondary(boardState, currentPlayer, row, col, 0, -1) ||
                didWinSecondary(boardState, currentPlayer, row, col, 1, 1) ||
                didWinSecondary(boardState, currentPlayer, row, col, -1, -1) ||
                didWinSecondary(boardState, currentPlayer, row, col, -1, 1) ||
                didWinSecondary(boardState, currentPlayer, row, col, 1, -1);
}