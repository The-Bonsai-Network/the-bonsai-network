package network.bonsai.thebonsainetwork

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}