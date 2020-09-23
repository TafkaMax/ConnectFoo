import { StackScreenProps } from '@react-navigation/stack';
import React, { useState } from 'react';
import { StyleSheet, useWindowDimensions } from 'react-native';
import { View } from 'react-native';
import { StackParams } from '../types/navigation';
import { AppContextProvider, PlayerType, IAppContext, initialContext } from '../context/AppContext';
import { GameStatistics } from '../components/GameStatistics';
import { GameBoard } from '../components/GameBoard';


type Props = StackScreenProps<StackParams, 'Home'>;

export const HomeScreen = () => {
    const window = useWindowDimensions();
    const isPortrait = () => window.height > window.width;
    const orientationStyle = () => (isPortrait() ? 'column' : 'row');
    const startNewGame = (startingPlayer: PlayerType) => {
        setState({...state, moves: 0, nextMoveBy: startingPlayer});
    };
    const makeMove = () => {
        setState((prevState) => ({
            ...prevState,
            moves: prevState.moves + 1,
            nextMoveBy: prevState.nextMoveBy === 'R' ? 'B' : 'R'
        }));
    }
    const initalstate: IAppContext = {
        ...initialContext,
        startNewGame: startNewGame,
        makeMove: makeMove
    }

    const [state, setState] = useState(initalstate);
    return (
        <AppContextProvider value={state}>
            <View style= {{
                ...styles.root,
                flexDirection: orientationStyle()
            }}>
                <GameStatistics/>
                <GameBoard/>
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
  
  