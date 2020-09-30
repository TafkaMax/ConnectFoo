import React from 'react';
import { GameButton } from '../components/GameButton'

// R = red, B = Blue and "" is empty slot.
export type PlayerType = 'R' | 'B' | '';

export interface IAppContext {
    moves: number;
    nextMoveBy: PlayerType;
    startNewGame: (startingPlayer: PlayerType) => void;
    makeMove: () => void;
    boardState: PlayerType[][]
}

const emptyFunction = () => {};

const createNewArray = () => {
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
};

export const AppContext = React.createContext<IAppContext>(initialContext);
export const AppContextProvider = AppContext.Provider;
export const AppContextConsumer = AppContext.Consumer;
