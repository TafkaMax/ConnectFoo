import { StyleSheet, View, Text, Button } from "react-native";
import React from 'react';
import { IAppContext, AppContextConsumer } from "../context/AppContext";


// type Props = {
//     state : IAppContext;
// }

export const GameStatistics = () => {
    return (
    <AppContextConsumer>
        { value => 
            <View style={styles.stat_page}>
                <Text>Number of moves : {value.moves}</Text>
                <Text>Next move by player: {value.nextMoveBy}</Text>
                <Button title="Reset game" onPress={() => {value.startNewGame('B')}}/>
            </View>
        }
    </AppContextConsumer>
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