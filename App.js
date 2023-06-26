/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
import * as React from 'react';
import { View, Text } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import HomeScreen from './src/screens/Home';
import DealAndMeal from './src/screens/DealAndMeal';
import McDelivery from './src/screens/McDelivery';
import More from './src/screens/More';
import Order from './src/screens/Order';
import Restaurant from './src/screens/Restaurant';

//import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
//import { Icon } from 'react-native-elements';
// const Stack = createNativeStackNavigator();
// function MyStack() {
//   return (
//     <Stack.Navigator>
//       <Stack.Screen name="Home" component={HomeScreen} options={{
//         headerShown: false,
//       }} />
//       <Stack.Screen name="McDelivery" component={McDelivery} />
//       <Stack.Screen name="DealAndMeal" component={DealAndMeal} />
//       <Stack.Screen name="Order" component={Order} />
//       <Stack.Screen name="Restaurant" component={Restaurant} />
//       <Stack.Screen name="More" component={More} />
//     </Stack.Navigator>
//   );
// }

const Tab = createBottomTabNavigator();

function MyTabs() {
  return (
    <Tab.Navigator
      screenOptions={{
        tabBarActiveTintColor: '#ec4c34',
      }}>
      <Tab.Screen name="Home"
        component={HomeScreen}
        options={{
          tabBarLabel: 'Home',
          // tabBarIcon: ({ color, size }) => (
          //   <Icon type="MaterialCommunityIcons"
          //     name="home" />
          // ),
        }} />
      <Tab.Screen name="McDelivery"
        component={McDelivery}
        options={{
          tabBarLabel: 'McDelivery',
          // tabBarIcon: ({ color, size }) => (
          //   <Icon name="home" color="gray" size={32} />
          // ),
        }} />
      <Tab.Screen name="DealAndMeal" component={DealAndMeal} options={{
        tabBarLabel: 'DealAndMeal',
        // tabBarIcon: ({ color, size }) => (
        //   <Icon name="home" color={color} size={32} />
        // ),
      }} />
      <Tab.Screen name="Order" component={Order} options={{
        tabBarLabel: 'Order',
        // tabBarIcon: ({ color, size }) => (
        //   <Icon name="home" color={color} size={32} />
        // ),
      }} />
      <Tab.Screen name="Restaurant" component={Restaurant} options={{
        tabBarLabel: 'Restaurant',
        // tabBarIcon: ({ color, size }) => (
        //   <Icon name="home" color={color} size={32} />
        // ),
      }} />
      <Tab.Screen name="More" component={More} options={{
        tabBarLabel: 'More',
        // tabBarIcon: ({ color, size }) => (
        //   <Icon name="home" color={color} size={32} />
        // ),
      }} />
    </Tab.Navigator>
  );
}
export default function App() {
  return (
    <NavigationContainer>
      <MyTabs />
    </NavigationContainer>

  )
}