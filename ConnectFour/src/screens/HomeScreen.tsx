import { StackScreenProps } from '@react-navigation/stack';
import React, { useState } from 'react';
import { StyleSheet, useWindowDimensions } from 'react-native';
import { View } from 'react-native';
import { StackParams } from '../types/navigation';
import { AppContextProvider, PlayerType, IAppContext, initialContext, createNewArray } from '../context/AppContext';
import { GameStatistics } from '../components/GameStatistics';
import { GameBoard } from '../components/GameBoard';
import { checkForSpotInColumn, didWinMain, validMove } from '../helpers/helpermethods';




type Props = StackScreenProps<StackParams, 'Home'>;

export const HomeScreen = () => {
    
    const window = useWindowDimensions();
    const isPortrait = () => window.height > window.width;
    const orientationStyle = () => (isPortrait() ? 'column' : 'row');

    const startNewGame = (startingPlayer: PlayerType) => {
        setState((prevState) => ({
            ...prevState,
            moves: 0,
            nextMoveBy: startingPlayer,
            boardState: createNewArray(),
            isWon: false
        }));
        console.log(state.boardState);
        console.log('----------------------------------------------------');
    };

    const makeMove = (currentPlayer: PlayerType, y: number, x: number) => {
        setState((prevState) => ({
            ...prevState,
            moves: prevState.moves + 1,
            nextMoveBy: prevState.nextMoveBy === 'R' ? 'B' : 'R',
            boardState: setMoveToCell(prevState.boardState, currentPlayer, y, x),
        }));
        
        setState((prevState) => ({
            ...prevState,
            moves: prevState.moves,
            nextMoveBy: prevState.nextMoveBy,
            boardState: prevState.boardState,
            isWon : didWinMain(prevState.boardState, currentPlayer, y, x)
        }))
    }

    const setMoveToCell = (prevBoardState: PlayerType[][], currentPlayer: PlayerType, y: number, x: number) => {
        if(validMove(prevBoardState, currentPlayer, y, x)) {
            let i = checkForSpotInColumn(prevBoardState, currentPlayer, y, x);
            if (i !== undefined) {
                prevBoardState[i][x] = currentPlayer;
            } 
        }
        return prevBoardState;
    }

    const initalstate: IAppContext = {
        ...initialContext,
        startNewGame: startNewGame,
        makeMove: makeMove,
        moves: initialContext.moves,
        boardState: initialContext.boardState,
        isWon: false
    } 

    const [state, setState] = useState(initalstate);
    return (
        <AppContextProvider value={state}>
            <View style= {{
                ...styles.root,
                flexDirection: orientationStyle()
            }}>
                <GameStatistics
                />
                    
                
                <GameBoard
                    isPortrait = {isPortrait}
                    />
                {console.log(state.isWon)}
                {console.log('----------------------------------------------------')}
            </View>
        </AppContextProvider>
    );
};

const styles = StyleSheet.create({
    root: {
      flex: 1,
      width: '100%',
      height: '100%'
    }
  });
  


  