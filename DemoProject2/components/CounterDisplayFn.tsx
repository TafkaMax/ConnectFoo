import React from 'react';
import { StyleSheet, Text, View} from 'react-native';

export interface Props {
    counter1: number,
}

export const CounterDisplayFn = (props: Props) => (
    <View style={styles.size_h50}>
        <Text>{props.counter1}</Text>
    </View>
);

const styles = StyleSheet.create({
    size_h50: {
        flex: 1,
        width: '100%',
        height: '50%',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FF0000'
    }
});