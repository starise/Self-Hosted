#  "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

variable "timezone" {
    type = string
    description = "Server timezone"
    default = "Etc/UTC"
}

variable "keymap" {
    type = string
    description = "Persistent keyboard layout"
    default = "us"
}

variable "locale" {
    type = string
    description = "Current locale"
    default = "en_US.UTF-8"
}

variable "net_address" {
    type = string
    description = "Static IP address and its prefix length"
}

variable "net_gateway" {
    type = string
    description = "Gateway address"
}

variable "hostname" {
    type = string
    description = "Server hostname"
    default = "alarmpi"
}

variable "username" {
    type = string
    description = "Server username"
    default = "alarm"
}

variable "auth_sshkey" {
    type = string
    description = "File containing SSH authorized key"
    default = "~/.ssh/id_rsa.pub"
}
