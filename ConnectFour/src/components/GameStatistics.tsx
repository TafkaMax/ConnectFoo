import { StyleSheet, View, Text, Button } from "react-native";
import React from 'react';
import { IAppContext } from "../context/AppContext";


type Props = {
    state : IAppContext;
}

export const GameStatistics = ({state} : Props) => {
    return (
    <View style={styles.stat_page}>
        <Text>Number of moves : {state.moves}</Text>
        <Text>Next move by player: {state.nextMoveBy}</Text>
        <Button title="Reset game" onPress={() => {state.startNewGame('B')}}/>
    </View>
    );
};


const styles = StyleSheet.create({
    stat_page: {
        flex: 1,
        width: '100%',
        height: '100%',
        justifyContent: 'space-evenly',
        alignItems: 'center',
    }
});