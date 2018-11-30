// import {applyMiddleware, combineReducers, compose, createStore} from 'redux'
// import thunk from 'redux-thunk'
// import ReduxPromise from 'redux-promise'
//
// const rootReducer = combineReducers({
//     domains,
//     hosts,
//     selectedHost,
//     hostGroups,
//     selectedHostGroup,
//     services,
//     serviceRequests,
// })
//
// const middleware = [thunk, ReduxPromise]
//
// export default initialState => {
//     return createStore(
//         rootReducer,
//         initialState,
//         compose(
//             applyMiddleware(...middleware),
//             window.devToolsExtension ? window.devToolsExtension() : f => f
//         )
//     )
// }
