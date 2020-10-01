import React from 'react';

// R = red, B = Blue and "" is empty slot.
export type PlayerType = 'R' | 'B' | '';

export interface IAppContext {
    moves: number;
    nextMoveBy: PlayerType;
    startNewGame: (startingPlayer: PlayerType) => void;
    makeMove: (CurrentPlayer : PlayerType, y: number, x: number) => void;
    boardState: PlayerType[][];
    isWon: boolean;
}

//(boardState: PlayerType[][], CurrentPlayer : PlayerType, col: number, row: number) => void;

const emptyFunction = () => {};

export const createNewArray = () => {
    const array = new Array<PlayerType[]>(6);
    for (let i = 0; i < array.length; i++) {
        array[i] = new Array<PlayerType>(7);
        for (let j = 0; j < array[i].length; j++) {
            array[i][j] = '';
       }   
    }
    return array;
} 
    
export const initialContext: IAppContext = {
    moves: 0,
    nextMoveBy: 'R',
    startNewGame: emptyFunction,
    makeMove: emptyFunction,
    boardState: createNewArray(),
    isWon: false
};

export const AppContext = React.createContext<IAppContext>(initialContext);
export const AppContextProvider = AppContext.Provider;
export const AppContextConsumer = AppContext.Consumer;
