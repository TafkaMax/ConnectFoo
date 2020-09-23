import React from 'react';

// tic-tac-toe
export type PlayerType = 'R' | 'B';

export interface IAppContext {
    moves: number;
    nextMoveBy: PlayerType;
    startNewGame: (startingPlayer: PlayerType) => void;
    makeMove: () => void;
}

const emptyFunction = () => {};

export const initialContext: IAppContext = {
    moves: 0,
    nextMoveBy: 'R',
    startNewGame: emptyFunction,
    makeMove: emptyFunction,
};

export const AppContext = React.createContext<IAppContext>(initialContext);
export const AppContextProvider = AppContext.Provider;
export const AppContextConsumer = AppContext.Consumer;
