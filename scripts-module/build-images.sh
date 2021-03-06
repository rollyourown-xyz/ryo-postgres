#!/bin/bash

# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Default software versions
postgres_version='13'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

helpMessage()
{
   echo "build-images.sh: Use packer to build images for deployment"
   echo ""
   echo "Help: build-images.sh"
   echo "Usage: ./build-images.sh -n hostname -v version"
   echo "Flags:"
   echo -e "-n hostname \t\t\t(Mandatory) Name of the host for which to build images"
   echo -e "-v version \t\t\t(Mandatory) Version stamp to apply to images, e.g. 20210101-1"
   echo -e "-r remote_build \t\t(Mandatory) Whether to build images on the remote LXD host (true/false)"
   echo -e "-p postgres_version \t\t(Optional) Override default postgres *major* version to use for the postgres image, e.g. 13 (default)"
   echo -e "-h \t\t\t\tPrint this help message"
   echo ""
   exit 1
}

errorMessage()
{
   echo "Invalid option or mandatory input variable is missing"
   echo "Use \"./build-images.sh -h\" for help"
   exit 1
}

while getopts n:v:r:p:h flag
do
    case "${flag}" in
        n) hostname=${OPTARG};;
        v) version=${OPTARG};;
        r) remote_build=${OPTARG};;
        p) postgres_version=${OPTARG};;
        h) helpMessage ;;
        ?) errorMessage ;;
    esac
done

if [ -z "$hostname" ] || [ -z "$version" ] || [ -z "$remote_build" ] || [ -z "$postgres_version" ]
then
   errorMessage
fi


# Get Module ID from configuration file
MODULE_ID="$(yq eval '.module_id' "$SCRIPT_DIR"/../configuration/configuration.yml)"

echo "Building images for "$MODULE_ID" module on "$hostname""
echo ""
echo "Building PostgreSQL image"
echo ""
echo "Executing command: packer build -var \"host_id="$hostname"\" -var \"version="$version"\" -var \"remote="$remote_build"\" -var \"postgres_version="$postgres_version"\" "$SCRIPT_DIR"/../image-build/postgres.pkr.hcl"
echo ""
packer build -var "host_id="$hostname"" -var "version="$version"" -var "remote="$remote_build"" -var "postgres_version="$postgres_version"" "$SCRIPT_DIR"/../image-build/postgres.pkr.hcl
echo ""
