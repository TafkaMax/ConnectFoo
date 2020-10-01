import { StackScreenProps } from '@react-navigation/stack';
import React, { useState } from 'react';
import { StyleSheet, useWindowDimensions } from 'react-native';
import { View } from 'react-native';
import { StackParams } from '../types/navigation';
import { AppContextProvider, PlayerType, IAppContext, initialContext, createNewArray } from '../context/AppContext';
import { GameStatistics } from '../components/GameStatistics';
import { GameBoard } from '../components/GameBoard';
import { useLinkProps } from '@react-navigation/native';


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
            boardState: createNewArray()
        }));
        console.log(state.boardState);
    };

    const makeMove = (currentPlayer: PlayerType, y: number, x: number) => {
        setState((prevState) => ({
            ...prevState,
            moves: prevState.moves + 1,
            nextMoveBy: prevState.nextMoveBy === 'R' ? 'B' : 'R',
            boardState: setMoveToCell(prevState.boardState, currentPlayer, y, x),
        }));
        console.log(state.boardState);
    }

    

    const setMoveToCell = (prevBoardState: PlayerType[][], currentPlayer: PlayerType, y: number, x: number) => {
        for (let i = 0; i < prevBoardState.length; i++) {
            for (let j = 0; j < prevBoardState[i].length; j++) {
                if(i === y && j === x) {
                    prevBoardState[y][x] = currentPlayer;
                }
            }
        }
        console.log(prevBoardState);
        return prevBoardState;
        
    }

    const initalstate: IAppContext = {
        ...initialContext,
        startNewGame: startNewGame,
        makeMove: makeMove,
        moves: initialContext.moves,
        boardState: initialContext.boardState,
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
  
  