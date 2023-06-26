//import liraries
import React, { Component, useEffect, useState } from 'react';
import { View, Text, StyleSheet, Image, ScrollView, Button, FlatList } from 'react-native';
import axios from 'axios';

const McDelivery = (props) => {

    props.navigation.setOptions({
        headerTitleStyle: { alignSelf: "center" },
        headerTitle: () => (
            <View
                style={{
                    flex: 1,
                    flexDirection: "row",
                    alignItems: "center",
                    justifyContent: "center",
                }}
            >
                <Text
                    style={{
                        color: "white",
                        fontSize: 20,
                        marginRight: 11,
                        textAlign: 'center'
                    }}
                >
                    McDelivery
                </Text>
            </View>
        ),
        headerStyle: {
            borderBottomWidth: 0,
            backgroundColor: "#EB616F",
        },
        headerTintColor: "#000000",
    });


    const [breakfastCategoryList, setBreakfastCategoryList] = useState([]);
    const [regualrCategoryList, setRegularCategoryList] = useState([]);

    useEffect(() => {
        //get breakfast menu
        getAllCategories(0);
        //get regular menu
        getAllCategories(1);
    })
    const getAllCategories = (menuType) => {

        // Make a request for a regular menu category
        axios.get('https://10.0.2.2:3001/getAllCategories/0')
            .then(function (response) {

                console.log(response);
            })
            .catch(function (error) {
                // handle error
                console.log(error);
            })
            .finally(function () {
                // always executed
            });


    }

    const getAllItems = (categoryId) => {
        // Make a request for a regular menu category
        axios.get('https://127.0.0.1:3001/getItems/', {
            params: {
                category_id: categoryId
            }
        })
            .then(function (response) {
                // handle success
                console.log(response);
            })
            .catch(function (error) {
                // handle error
                console.log(error);
            })
            .finally(function () {
                // always executed
            });
    }
    const DATA = [
        {
            id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
            title: 'First Item',
        },
        {
            id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
            title: 'Second Item',
        },
        {
            id: '58694a0f-3da1-471f-bd96-145571e29d72',
            title: 'Third Item',
        },
        {
            id: '58694a0f-3da1-471f--145571e29d72',
            title: 'Third Item',
        },
        {
            id: '58694a0f-3da1-471f-bd96-',
            title: 'Third Item',
        },
        {
            id: '-3da1-471f-bd96-145571e29d72',
            title: 'Third Item',
        },
    ];

    const Item = ({ title }) => (
        <View style={styles.itemStyle}>
            <Text style={styles.title}>{title}</Text>
        </View>
    );

    const Category = ({ title }) => (
        <View style={styles.categoryStyle}>
            <Text style={styles.title}>{title}</Text>
        </View>
    );
    return (

        <View style={styles.container}>

            <View style={{ flexDirection: 'row', padding: 16, width: '100%', margin: 20, backgroundColor: 'white' }} >
                <Text style={{ flex: 1, marginLeft: 20, fontWeight: 'bold' }} >Breakfast Menu</Text>
                <Button title='Change' style={{ flex: 1, marginRight: 20 }}></Button>
            </View>

            <ScrollView
                showsHorizontalScrollIndicator={false}
                style={{ width: '100%', marginBottom: 8 }}>
                <FlatList
                    horizontal
                    data={DATA}
                    renderItem={({ item }) => <Category title={item.title} />}
                    keyExtractor={item => item.id}
                />
            </ScrollView>

            <ScrollView
                showsVerticalScrollIndicator={false}
                style={{ width: '100%' }}>
                <FlatList
                    scrollEnabled
                    data={DATA}
                    renderItem={({ item }) => <Item title={item.title} />}
                    keyExtractor={item => item.id}
                />
            </ScrollView>


        </View>
    );
};

// define your styles
const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#efefef'

    },
    itemStyle: {
        backgroundColor: 'white',
        height: 200
    },
    categoryStyle: {
        backgroundColor: 'white',
        width: 200,
        height: 32,

    }
});

//make this component available to the app
export default McDelivery;
