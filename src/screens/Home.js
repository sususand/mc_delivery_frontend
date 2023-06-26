//import liraries
import React, { Component } from 'react';
import { View, Text, StyleSheet, Image, StatusBar, Button } from 'react-native';

// create a component
const HomeScreen = (props) => {
    props.navigation.setOptions({
        headerShown: false
    });

    return (
        <View style={styles.container}>
            <StatusBar
                animated={true}
                backgroundColor="#de031a"
            />
            <Image
                style={styles.imageStyle}
                source={require('../assets/home-bg.png')}
            />
            <View style={{ width: '50%', paddingLeft: 20, paddingRight: 20, paddingTop: 20 }}>
                <Button
                    title="Mobile Order Now!"
                    style={styles.buttonStyle}
                    color="#FFFFFF80"
                />
            </View>

            <View style={{ flex: 4, flexDirection: 'column', paddingBottom: 10 }}>
                <View style={{ flex: 2, flexDirection: 'row', padding: 10 }}>
                    <Image
                        style={styles.gridImageStyle}
                        source={require('../assets/home-img1.png')} />

                    <Image
                        style={styles.gridImageStyle}
                        source={require('../assets/home-img2.png')} />
                </View>

                <View style={{ flex: 2, flexDirection: 'row', padding: 10 }}>
                    <Image
                        onPress={() =>
                            navigation.navigate('McDelivery')
                        }
                        style={styles.gridImageStyle}
                        source={require('../assets/home-img3.png')} />

                    <Image
                        style={styles.gridImageStyle}
                        source={require('../assets/home-img4.png')} />
                </View>
            </View>

        </View>
    );
};

// define your styles
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#de031a',
    },
    imageStyle: {
        width: '100%',
    },
    buttonStyle: {
        width: '24px',
        flex: 2,
    },
    gridImageStyle: {
        borderRadius: 5, backgroundColor: 'white', flex: 1, margin: 10, height: '100%'
    }
});

//make this component available to the app
export default HomeScreen;
