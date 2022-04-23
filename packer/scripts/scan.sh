#!/bin/bash -eux

#OpenSCAP compliance scanning

sudo yum install -y openscap-scanner
sudo yum install -y scap-security-guide
mkdir -p /var/tmp/roles/security
sudo wget --quiet -O /var/tmp/roles/security/Red_Hat_Enterprise_Linux_7.xml https://www.redhat.com/security/data/oval/Red_Hat_Enterprise_Linux_7.xml
# local base_dir="/var/tmp/roles/security"
# local output_dir="$base_dir/output"
mkdir -p /var/tmp/roles/security/output
echo "Running PCI compliance scan..."
sudo oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_pci-dss --results-arf /var/tmp/roles/securityoutput/arf-pci-dss.xml --report $output_dir/report-pci-dss.html /usr/share/xml/scap/ssg/content/ssg-amzn2-ds.xml
echo "Running DISA STIG compliance scan..."
sudo oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_stig-rhel7-disa --results-arf /var/tmp/roles/securityoutput/arf-disa-stig.xml --report $output_dir/report-disa-stig.html /usr/share/xml/scap/ssg/content/ssg-amzn2-ds.xml
