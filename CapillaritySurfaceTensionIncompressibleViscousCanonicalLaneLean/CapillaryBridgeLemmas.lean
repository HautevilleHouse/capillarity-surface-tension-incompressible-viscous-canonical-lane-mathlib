import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaryAdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CapillaryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse